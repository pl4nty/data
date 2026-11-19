-- Threat: !InfrastructureShared
-- Name: 5a787d487dd7
-- Type: 21

if peattributes.isexe then
  local l_0_0 = mp.getfilesize()
  if 7340032 < l_0_0 and l_0_0 < 10485760 and pe.query_import(pe.IMPORT_STATIC, 660922497) ~= 0 then
    if not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
