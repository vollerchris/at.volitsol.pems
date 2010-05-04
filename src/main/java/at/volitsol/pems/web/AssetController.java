package at.volitsol.pems.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import at.volitsol.pems.domain.Asset;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "asset", automaticallyMaintainView = true, formBackingObject = Asset.class)
@RequestMapping("/asset/**")
@Controller
public class AssetController {
}
