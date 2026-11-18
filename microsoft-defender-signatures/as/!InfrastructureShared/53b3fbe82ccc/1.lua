-- Threat: !InfrastructureShared
-- Name: 53b3fbe82ccc
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

sms_untrusted_process()
pcall(add_parents, "-1", 5)
TrackPidAndTechniqueBM("BM", "T1003.001", "credentialdumping", 86400)
return mp.INFECTED
