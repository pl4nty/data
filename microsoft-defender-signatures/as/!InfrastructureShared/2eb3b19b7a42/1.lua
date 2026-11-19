-- Threat: !InfrastructureShared
-- Name: 2eb3b19b7a42
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

sms_untrusted_process()
pcall(add_parents, "-1", 5)
TrackPidAndTechniqueBM("BM", "T1003.001", "credentialdumping", 86400)
return mp.INFECTED
