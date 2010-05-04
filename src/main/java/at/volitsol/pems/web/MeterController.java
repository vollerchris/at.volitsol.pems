package at.volitsol.pems.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import at.volitsol.pems.domain.Meter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "meter", automaticallyMaintainView = true, formBackingObject = Meter.class)
@RequestMapping("/meter/**")
@Controller
public class MeterController {
}
