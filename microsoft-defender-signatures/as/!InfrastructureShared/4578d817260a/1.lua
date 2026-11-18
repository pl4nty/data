-- Threat: !InfrastructureShared
-- Name: 4578d817260a
-- Type: 21

if pe.query_import(pe.IMPORT_STATIC, 2515381460) ~= 0 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
