package at.volitsol.pems.web;

import at.volitsol.pems.domain.Facility;
import at.volitsol.pems.domain.Location;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect FacilityController_Roo_Controller {
    
    @RequestMapping(value = "/facility", method = RequestMethod.POST)
    public String FacilityController.create(@Valid Facility facility, BindingResult result, ModelMap modelMap) {
        if (facility == null) throw new IllegalArgumentException("A facility is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("facility", facility);
            modelMap.addAttribute("locations", Location.findAllLocations());
            return "facility/create";
        }
        facility.persist();
        return "redirect:/facility/" + facility.getId();
    }
    
    @RequestMapping(value = "/facility/form", method = RequestMethod.GET)
    public String FacilityController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("facility", new Facility());
        modelMap.addAttribute("locations", Location.findAllLocations());
        return "facility/create";
    }
    
    @RequestMapping(value = "/facility/{id}", method = RequestMethod.GET)
    public String FacilityController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("facility", Facility.findFacility(id));
        return "facility/show";
    }
    
    @RequestMapping(value = "/facility", method = RequestMethod.GET)
    public String FacilityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("facilitys", Facility.findFacilityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Facility.countFacilitys() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("facilitys", Facility.findAllFacilitys());
        }
        return "facility/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String FacilityController.update(@Valid Facility facility, BindingResult result, ModelMap modelMap) {
        if (facility == null) throw new IllegalArgumentException("A facility is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("facility", facility);
            modelMap.addAttribute("locations", Location.findAllLocations());
            return "facility/update";
        }
        facility.merge();
        return "redirect:/facility/" + facility.getId();
    }
    
    @RequestMapping(value = "/facility/{id}/form", method = RequestMethod.GET)
    public String FacilityController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("facility", Facility.findFacility(id));
        modelMap.addAttribute("locations", Location.findAllLocations());
        return "facility/update";
    }
    
    @RequestMapping(value = "/facility/{id}", method = RequestMethod.DELETE)
    public String FacilityController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Facility.findFacility(id).remove();
        return "redirect:/facility?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
