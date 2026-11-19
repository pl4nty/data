-- Threat: !InfrastructureShared
-- Name: !#ALF:Tampering:Win32/MpTampering.A
-- Type: 13
-- MpAttributes: scpt:DefenderReg

if #mp.enum_mpattributesubstring("//scpt:TamperingReg_") >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
