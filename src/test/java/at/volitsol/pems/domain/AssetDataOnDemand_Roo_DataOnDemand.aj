package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Asset;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AssetDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AssetDataOnDemand: @Component;
    
    private Random AssetDataOnDemand.rnd = new SecureRandom();
    
    private List<Asset> AssetDataOnDemand.data;
    
    public Asset AssetDataOnDemand.getNewTransientAsset(int index) {
        at.volitsol.pems.domain.Asset obj = new at.volitsol.pems.domain.Asset();
        obj.setAssetName("assetName_" + index);
        return obj;
    }
    
    public Asset AssetDataOnDemand.getSpecificAsset(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Asset obj = data.get(index);
        return Asset.findAsset(obj.getId());
    }
    
    public Asset AssetDataOnDemand.getRandomAsset() {
        init();
        Asset obj = data.get(rnd.nextInt(data.size()));
        return Asset.findAsset(obj.getId());
    }
    
    public boolean AssetDataOnDemand.modifyAsset(Asset obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void AssetDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = at.volitsol.pems.domain.Asset.findAssetEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Asset' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<at.volitsol.pems.domain.Asset>();
        for (int i = 0; i < 10; i++) {
            at.volitsol.pems.domain.Asset obj = getNewTransientAsset(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
