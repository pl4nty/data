-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8758_306.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("LUA:VeriatoCertClean") or (mp.get_mpattribute)("Exception:MonitoringTool:Uninstaller:Veriato") or (mp.get_mpattribute)("CERT:Clean:Veriato") then
  return mp.CLEAN
end
return mp.INFECTED

