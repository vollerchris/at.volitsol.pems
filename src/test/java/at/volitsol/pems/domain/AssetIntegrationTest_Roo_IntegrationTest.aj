package at.volitsol.pems.domain;

import at.volitsol.pems.domain.AssetDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AssetIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AssetIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AssetIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private AssetDataOnDemand AssetIntegrationTest.dod;
    
    @Test
    public void AssetIntegrationTest.testCountAssets() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        long count = at.volitsol.pems.domain.Asset.countAssets();
        org.junit.Assert.assertTrue("Counter for 'Asset' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AssetIntegrationTest.testFindAsset() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        java.lang.Long id = dod.getRandomAsset().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to provide an identifier", id);
        at.volitsol.pems.domain.Asset obj = at.volitsol.pems.domain.Asset.findAsset(id);
        org.junit.Assert.assertNotNull("Find method for 'Asset' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Asset' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AssetIntegrationTest.testFindAllAssets() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        long count = at.volitsol.pems.domain.Asset.countAssets();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Asset', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<at.volitsol.pems.domain.Asset> result = at.volitsol.pems.domain.Asset.findAllAssets();
        org.junit.Assert.assertNotNull("Find all method for 'Asset' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Asset' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AssetIntegrationTest.testFindAssetEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        long count = at.volitsol.pems.domain.Asset.countAssets();
        if (count > 20) count = 20;
        java.util.List<at.volitsol.pems.domain.Asset> result = at.volitsol.pems.domain.Asset.findAssetEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Asset' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Asset' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void AssetIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        java.lang.Long id = dod.getRandomAsset().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to provide an identifier", id);
        at.volitsol.pems.domain.Asset obj = at.volitsol.pems.domain.Asset.findAsset(id);
        org.junit.Assert.assertNotNull("Find method for 'Asset' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAsset(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Asset' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void AssetIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        java.lang.Long id = dod.getRandomAsset().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to provide an identifier", id);
        at.volitsol.pems.domain.Asset obj = at.volitsol.pems.domain.Asset.findAsset(id);
        org.junit.Assert.assertNotNull("Find method for 'Asset' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAsset(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Asset' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void AssetIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        at.volitsol.pems.domain.Asset obj = dod.getNewTransientAsset(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Asset' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Asset' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void AssetIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to initialize correctly", dod.getRandomAsset());
        java.lang.Long id = dod.getRandomAsset().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Asset' failed to provide an identifier", id);
        at.volitsol.pems.domain.Asset obj = at.volitsol.pems.domain.Asset.findAsset(id);
        org.junit.Assert.assertNotNull("Find method for 'Asset' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Asset' with identifier '" + id + "'", at.volitsol.pems.domain.Asset.findAsset(id));
    }
    
}
