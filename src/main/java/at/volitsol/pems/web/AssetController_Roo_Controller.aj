package at.volitsol.pems.web;

import at.volitsol.pems.domain.Asset;
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

privileged aspect AssetController_Roo_Controller {
    
    @RequestMapping(value = "/asset", method = RequestMethod.POST)
    public String AssetController.create(@Valid Asset asset, BindingResult result, ModelMap modelMap) {
        if (asset == null) throw new IllegalArgumentException("A asset is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("asset", asset);
            modelMap.addAttribute("meters", Meter.findAllMeters());
            return "asset/create";
        }
        asset.persist();
        return "redirect:/asset/" + asset.getId();
    }
    
    @RequestMapping(value = "/asset/form", method = RequestMethod.GET)
    public String AssetController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("asset", new Asset());
        modelMap.addAttribute("meters", Meter.findAllMeters());
        return "asset/create";
    }
    
    @RequestMapping(value = "/asset/{id}", method = RequestMethod.GET)
    public String AssetController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("asset", Asset.findAsset(id));
        return "asset/show";
    }
    
    @RequestMapping(value = "/asset", method = RequestMethod.GET)
    public String AssetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("assets", Asset.findAssetEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Asset.countAssets() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("assets", Asset.findAllAssets());
        }
        return "asset/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AssetController.update(@Valid Asset asset, BindingResult result, ModelMap modelMap) {
        if (asset == null) throw new IllegalArgumentException("A asset is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("asset", asset);
            modelMap.addAttribute("meters", Meter.findAllMeters());
            return "asset/update";
        }
        asset.merge();
        return "redirect:/asset/" + asset.getId();
    }
    
    @RequestMapping(value = "/asset/{id}/form", method = RequestMethod.GET)
    public String AssetController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("asset", Asset.findAsset(id));
        modelMap.addAttribute("meters", Meter.findAllMeters());
        return "asset/update";
    }
    
    @RequestMapping(value = "/asset/{id}", method = RequestMethod.DELETE)
    public String AssetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Asset.findAsset(id).remove();
        return "redirect:/asset?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
