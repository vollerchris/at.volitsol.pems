package at.volitsol.pems.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import at.volitsol.pems.domain.Facility;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "facility", automaticallyMaintainView = true, formBackingObject = Facility.class)
@RequestMapping("/facility/**")
@Controller
public class FacilityController {
}
