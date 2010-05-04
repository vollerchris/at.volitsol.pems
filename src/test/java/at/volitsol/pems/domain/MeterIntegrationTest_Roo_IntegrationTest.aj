package at.volitsol.pems.domain;

import at.volitsol.pems.domain.MeterDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MeterIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MeterIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MeterIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private MeterDataOnDemand MeterIntegrationTest.dod;
    
    @Test
    public void MeterIntegrationTest.testCountMeters() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        long count = at.volitsol.pems.domain.Meter.countMeters();
        org.junit.Assert.assertTrue("Counter for 'Meter' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MeterIntegrationTest.testFindMeter() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        java.lang.Long id = dod.getRandomMeter().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to provide an identifier", id);
        at.volitsol.pems.domain.Meter obj = at.volitsol.pems.domain.Meter.findMeter(id);
        org.junit.Assert.assertNotNull("Find method for 'Meter' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Meter' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MeterIntegrationTest.testFindAllMeters() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        long count = at.volitsol.pems.domain.Meter.countMeters();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Meter', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<at.volitsol.pems.domain.Meter> result = at.volitsol.pems.domain.Meter.findAllMeters();
        org.junit.Assert.assertNotNull("Find all method for 'Meter' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Meter' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MeterIntegrationTest.testFindMeterEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        long count = at.volitsol.pems.domain.Meter.countMeters();
        if (count > 20) count = 20;
        java.util.List<at.volitsol.pems.domain.Meter> result = at.volitsol.pems.domain.Meter.findMeterEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Meter' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Meter' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void MeterIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        java.lang.Long id = dod.getRandomMeter().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to provide an identifier", id);
        at.volitsol.pems.domain.Meter obj = at.volitsol.pems.domain.Meter.findMeter(id);
        org.junit.Assert.assertNotNull("Find method for 'Meter' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMeter(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Meter' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void MeterIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        java.lang.Long id = dod.getRandomMeter().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to provide an identifier", id);
        at.volitsol.pems.domain.Meter obj = at.volitsol.pems.domain.Meter.findMeter(id);
        org.junit.Assert.assertNotNull("Find method for 'Meter' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMeter(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Meter' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void MeterIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        at.volitsol.pems.domain.Meter obj = dod.getNewTransientMeter(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Meter' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Meter' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void MeterIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to initialize correctly", dod.getRandomMeter());
        java.lang.Long id = dod.getRandomMeter().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Meter' failed to provide an identifier", id);
        at.volitsol.pems.domain.Meter obj = at.volitsol.pems.domain.Meter.findMeter(id);
        org.junit.Assert.assertNotNull("Find method for 'Meter' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Meter' with identifier '" + id + "'", at.volitsol.pems.domain.Meter.findMeter(id));
    }
    
}
