-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\72b3adf5025d\0x000002e3_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if (SuspMacPathsToMonitor(l_0_0, true) or (string.find)(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_0, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_0, "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)(l_0_0) then
  (bm.add_threat_file)(l_0_0)
end
return mp.INFECTED

