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
import org.energyos.espi.datacustodian.common.ElectricPowerQualitySummary;
import org.energyos.espi.datacustodian.common.ElectricPowerQualitySummaryDataOnDemand;
import org.energyos.espi.datacustodian.common.ElectricPowerQualitySummaryIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ElectricPowerQualitySummaryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ElectricPowerQualitySummaryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ElectricPowerQualitySummaryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ElectricPowerQualitySummaryIntegrationTest: @Transactional;
    
    @Autowired
    ElectricPowerQualitySummaryDataOnDemand ElectricPowerQualitySummaryIntegrationTest.dod;
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testCountElectricPowerQualitySummarys() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", dod.getRandomElectricPowerQualitySummary());
        long count = ElectricPowerQualitySummary.countElectricPowerQualitySummarys();
        Assert.assertTrue("Counter for 'ElectricPowerQualitySummary' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testFindElectricPowerQualitySummary() {
        ElectricPowerQualitySummary obj = dod.getRandomElectricPowerQualitySummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to provide an identifier", id);
        obj = ElectricPowerQualitySummary.findElectricPowerQualitySummary(id);
        Assert.assertNotNull("Find method for 'ElectricPowerQualitySummary' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ElectricPowerQualitySummary' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testFindAllElectricPowerQualitySummarys() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", dod.getRandomElectricPowerQualitySummary());
        long count = ElectricPowerQualitySummary.countElectricPowerQualitySummarys();
        Assert.assertTrue("Too expensive to perform a find all test for 'ElectricPowerQualitySummary', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ElectricPowerQualitySummary> result = ElectricPowerQualitySummary.findAllElectricPowerQualitySummarys();
        Assert.assertNotNull("Find all method for 'ElectricPowerQualitySummary' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ElectricPowerQualitySummary' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testFindElectricPowerQualitySummaryEntries() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", dod.getRandomElectricPowerQualitySummary());
        long count = ElectricPowerQualitySummary.countElectricPowerQualitySummarys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ElectricPowerQualitySummary> result = ElectricPowerQualitySummary.findElectricPowerQualitySummaryEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ElectricPowerQualitySummary' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ElectricPowerQualitySummary' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testFlush() {
        ElectricPowerQualitySummary obj = dod.getRandomElectricPowerQualitySummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to provide an identifier", id);
        obj = ElectricPowerQualitySummary.findElectricPowerQualitySummary(id);
        Assert.assertNotNull("Find method for 'ElectricPowerQualitySummary' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyElectricPowerQualitySummary(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ElectricPowerQualitySummary' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testMergeUpdate() {
        ElectricPowerQualitySummary obj = dod.getRandomElectricPowerQualitySummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to provide an identifier", id);
        obj = ElectricPowerQualitySummary.findElectricPowerQualitySummary(id);
        boolean modified =  dod.modifyElectricPowerQualitySummary(obj);
        Integer currentVersion = obj.getVersion();
        ElectricPowerQualitySummary merged = (ElectricPowerQualitySummary)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ElectricPowerQualitySummary' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", dod.getRandomElectricPowerQualitySummary());
        ElectricPowerQualitySummary obj = dod.getNewTransientElectricPowerQualitySummary(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ElectricPowerQualitySummary' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ElectricPowerQualitySummary' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ElectricPowerQualitySummaryIntegrationTest.testRemove() {
        ElectricPowerQualitySummary obj = dod.getRandomElectricPowerQualitySummary();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ElectricPowerQualitySummary' failed to provide an identifier", id);
        obj = ElectricPowerQualitySummary.findElectricPowerQualitySummary(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ElectricPowerQualitySummary' with identifier '" + id + "'", ElectricPowerQualitySummary.findElectricPowerQualitySummary(id));
    }
    
}
