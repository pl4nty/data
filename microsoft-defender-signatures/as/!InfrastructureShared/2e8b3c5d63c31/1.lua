-- Threat: !InfrastructureShared
-- Name: 2e8b3c5d63c31
-- Type: 21
-- Includes: BMLuaLib

reportRelatedBmHits()
bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
return mp.INFECTED
