-- Threat: !InfrastructureShared
-- Name: 6d78b56529d1
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  local l_0_0 = mp.getfilesize()
  if 409600 < l_0_0 and l_0_0 < 716800 and pe.get_exports_count() == 9 then
    return mp.INFECTED
  end
end
return mp.CLEAN
