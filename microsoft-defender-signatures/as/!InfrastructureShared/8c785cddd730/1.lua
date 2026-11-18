-- Threat: !InfrastructureShared
-- Name: 8c785cddd730
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  local l_0_0 = mp.getfilesize()
  if 409600 < l_0_0 and l_0_0 < 716800 and pe.get_exports_count() == 9 then
    return mp.INFECTED
  end
end
return mp.CLEAN
