package at.volitsol.pems.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import at.volitsol.pems.domain.Location;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "location", automaticallyMaintainView = true, formBackingObject = Location.class)
@RequestMapping("/location/**")
@Controller
public class LocationController {
}
