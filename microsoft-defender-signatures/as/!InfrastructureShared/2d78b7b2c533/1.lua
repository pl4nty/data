-- Threat: !InfrastructureShared
-- Name: 2d78b7b2c533
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  local l_0_0 = mp.getfilesize()
  if 122880 < l_0_0 and l_0_0 < 358400 and pe.get_exports_count() == 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
