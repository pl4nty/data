-- Threat: !InfrastructureShared
-- Name: b9786f8277af
-- Type: 21

if mp.get_mpattribute("LUA:VeriatoCertClean") or mp.get_mpattribute("Exception:MonitoringTool:Uninstaller:Veriato") or mp.get_mpattribute("CERT:Clean:Veriato") then
  return mp.CLEAN
end
if hstrlog[2].hitcount > 3 then
  if mp.HSTR_WEIGHT == 26 then
    return mp.INFECTED
  end
  local l_0_0 = pe.mmap_va(hstrlog[1].VA - 18, 16)
  if string.find(l_0_0, "DenyListedUsers", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
