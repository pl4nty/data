-- Threat: !InfrastructureShared
-- Name: b07f6bf11f0c
-- Type: 21

if pe.isdynamic_va(pevars.sigaddr) then
  local l_0_0 = pe.query_import(pe.IMPORT_STATIC, 1589549540)
  if 0 ~= l_0_0 then
    return mp.INFECTED
  end
  local l_0_1 = pe.query_import(pe.IMPORT_STATIC, 3150467781)
  if 0 ~= l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
