-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\71d0_256.luac 

-- params : ...
-- function num : 0
if peattributes.suspicious_subsystem_version and peattributes.no_exports and peattributes.suspicious_os_version then
  return mp.INFECTED
end
return mp.CLEAN

