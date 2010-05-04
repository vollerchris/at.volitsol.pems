package at.volitsol.pems.web;

import at.volitsol.pems.domain.Meter;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect MeterController_Roo_Controller {
    
    @RequestMapping(value = "/meter", method = RequestMethod.POST)
    public String MeterController.create(@Valid Meter meter, BindingResult result, ModelMap modelMap) {
        if (meter == null) throw new IllegalArgumentException("A meter is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("meter", meter);
            return "meter/create";
        }
        meter.persist();
        return "redirect:/meter/" + meter.getId();
    }
    
    @RequestMapping(value = "/meter/form", method = RequestMethod.GET)
    public String MeterController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("meter", new Meter());
        return "meter/create";
    }
    
    @RequestMapping(value = "/meter/{id}", method = RequestMethod.GET)
    public String MeterController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("meter", Meter.findMeter(id));
        return "meter/show";
    }
    
    @RequestMapping(value = "/meter", method = RequestMethod.GET)
    public String MeterController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("meters", Meter.findMeterEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Meter.countMeters() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("meters", Meter.findAllMeters());
        }
        return "meter/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String MeterController.update(@Valid Meter meter, BindingResult result, ModelMap modelMap) {
        if (meter == null) throw new IllegalArgumentException("A meter is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("meter", meter);
            return "meter/update";
        }
        meter.merge();
        return "redirect:/meter/" + meter.getId();
    }
    
    @RequestMapping(value = "/meter/{id}/form", method = RequestMethod.GET)
    public String MeterController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("meter", Meter.findMeter(id));
        return "meter/update";
    }
    
    @RequestMapping(value = "/meter/{id}", method = RequestMethod.DELETE)
    public String MeterController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Meter.findMeter(id).remove();
        return "redirect:/meter?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
