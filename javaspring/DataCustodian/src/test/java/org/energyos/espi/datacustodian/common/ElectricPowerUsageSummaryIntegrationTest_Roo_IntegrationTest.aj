/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/


// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.common;

import java.util.List;
import org.energyos.espi.datacustodian.common.ElectricPowerUsageSummary;
import org.energyos.espi.datacustodian.common.ElectricPowerUsageSummaryDataOnDemand;
import org.energyos.espi.datacustodian.common.ElectricPowerUsageSummaryIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ElectricPowerUsageSummaryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ElectricPowerUsageSummaryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ElectricPowerUsageSummaryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ElectricPowerUsageSummaryIntegrationTest: @Transactional;
    
    @Autowired
    ElectricPowerUsageSummaryDataOnDemand ElectricPowerUsageSummaryIntegrationTest.dod;
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testCountElectricPowerUsageSummarys() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", dod.getRandomElectricPowerUsageSummary());
        long count = ElectricPowerUsageSummary.countElectricPowerUsageSummarys();
        Assert.assertTrue("Counter for 'ElectricPowerUsageSummary' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testFindElectricPowerUsageSummary() {
        ElectricPowerUsageSummary obj = dod.getRandomElectricPowerUsageSummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to provide an identifier", id);
        obj = ElectricPowerUsageSummary.findElectricPowerUsageSummary(id);
        Assert.assertNotNull("Find method for 'ElectricPowerUsageSummary' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ElectricPowerUsageSummary' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testFindAllElectricPowerUsageSummarys() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", dod.getRandomElectricPowerUsageSummary());
        long count = ElectricPowerUsageSummary.countElectricPowerUsageSummarys();
        Assert.assertTrue("Too expensive to perform a find all test for 'ElectricPowerUsageSummary', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ElectricPowerUsageSummary> result = ElectricPowerUsageSummary.findAllElectricPowerUsageSummarys();
        Assert.assertNotNull("Find all method for 'ElectricPowerUsageSummary' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ElectricPowerUsageSummary' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testFindElectricPowerUsageSummaryEntries() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", dod.getRandomElectricPowerUsageSummary());
        long count = ElectricPowerUsageSummary.countElectricPowerUsageSummarys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ElectricPowerUsageSummary> result = ElectricPowerUsageSummary.findElectricPowerUsageSummaryEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ElectricPowerUsageSummary' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ElectricPowerUsageSummary' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testFlush() {
        ElectricPowerUsageSummary obj = dod.getRandomElectricPowerUsageSummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to provide an identifier", id);
        obj = ElectricPowerUsageSummary.findElectricPowerUsageSummary(id);
        Assert.assertNotNull("Find method for 'ElectricPowerUsageSummary' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyElectricPowerUsageSummary(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ElectricPowerUsageSummary' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testMergeUpdate() {
        ElectricPowerUsageSummary obj = dod.getRandomElectricPowerUsageSummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to provide an identifier", id);
        obj = ElectricPowerUsageSummary.findElectricPowerUsageSummary(id);
        boolean modified =  dod.modifyElectricPowerUsageSummary(obj);
        Integer currentVersion = obj.getVersion();
        ElectricPowerUsageSummary merged = (ElectricPowerUsageSummary)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ElectricPowerUsageSummary' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", dod.getRandomElectricPowerUsageSummary());
        ElectricPowerUsageSummary obj = dod.getNewTransientElectricPowerUsageSummary(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ElectricPowerUsageSummary' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ElectricPowerUsageSummary' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ElectricPowerUsageSummaryIntegrationTest.testRemove() {
        ElectricPowerUsageSummary obj = dod.getRandomElectricPowerUsageSummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerUsageSummary' failed to provide an identifier", id);
        obj = ElectricPowerUsageSummary.findElectricPowerUsageSummary(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ElectricPowerUsageSummary' with identifier '" + id + "'", ElectricPowerUsageSummary.findElectricPowerUsageSummary(id));
    }
    
}
