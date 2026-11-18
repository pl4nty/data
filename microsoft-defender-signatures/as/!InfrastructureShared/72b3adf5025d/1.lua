-- Threat: !InfrastructureShared
-- Name: 72b3adf5025d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if (SuspMacPathsToMonitor(l_0_0, true) or string.find(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Desktop/", 1, false)) and sysio.IsFileExists(l_0_0) then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
