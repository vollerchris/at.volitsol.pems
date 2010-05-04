package at.volitsol.pems.domain;

import at.volitsol.pems.domain.FacilityDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FacilityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FacilityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FacilityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private FacilityDataOnDemand FacilityIntegrationTest.dod;
    
    @Test
    public void FacilityIntegrationTest.testCountFacilitys() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        long count = at.volitsol.pems.domain.Facility.countFacilitys();
        org.junit.Assert.assertTrue("Counter for 'Facility' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FacilityIntegrationTest.testFindFacility() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        java.lang.Long id = dod.getRandomFacility().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to provide an identifier", id);
        at.volitsol.pems.domain.Facility obj = at.volitsol.pems.domain.Facility.findFacility(id);
        org.junit.Assert.assertNotNull("Find method for 'Facility' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Facility' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void FacilityIntegrationTest.testFindAllFacilitys() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        long count = at.volitsol.pems.domain.Facility.countFacilitys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Facility', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<at.volitsol.pems.domain.Facility> result = at.volitsol.pems.domain.Facility.findAllFacilitys();
        org.junit.Assert.assertNotNull("Find all method for 'Facility' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Facility' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FacilityIntegrationTest.testFindFacilityEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        long count = at.volitsol.pems.domain.Facility.countFacilitys();
        if (count > 20) count = 20;
        java.util.List<at.volitsol.pems.domain.Facility> result = at.volitsol.pems.domain.Facility.findFacilityEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Facility' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Facility' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void FacilityIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        java.lang.Long id = dod.getRandomFacility().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to provide an identifier", id);
        at.volitsol.pems.domain.Facility obj = at.volitsol.pems.domain.Facility.findFacility(id);
        org.junit.Assert.assertNotNull("Find method for 'Facility' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFacility(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Facility' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void FacilityIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        java.lang.Long id = dod.getRandomFacility().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to provide an identifier", id);
        at.volitsol.pems.domain.Facility obj = at.volitsol.pems.domain.Facility.findFacility(id);
        org.junit.Assert.assertNotNull("Find method for 'Facility' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFacility(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Facility' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void FacilityIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        at.volitsol.pems.domain.Facility obj = dod.getNewTransientFacility(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Facility' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Facility' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void FacilityIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to initialize correctly", dod.getRandomFacility());
        java.lang.Long id = dod.getRandomFacility().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Facility' failed to provide an identifier", id);
        at.volitsol.pems.domain.Facility obj = at.volitsol.pems.domain.Facility.findFacility(id);
        org.junit.Assert.assertNotNull("Find method for 'Facility' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Facility' with identifier '" + id + "'", at.volitsol.pems.domain.Facility.findFacility(id));
    }
    
}
