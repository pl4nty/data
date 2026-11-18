-- Threat: !InfrastructureShared
-- Name: !#NewlyCreatedHint.Func
-- Type: 12

if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  mp.set_mpattribute("MpNewlyCreatedHint")
end
return mp.CLEAN
