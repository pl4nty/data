-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Script/SilverCandle.A!dha
-- Type: 13
-- MpAttributes: SCPT:SilverCandle.A1 | SCPT:SilverCandle.A2 | SCPT:SilverCandle.A3 | SCPT:SilverCandle.A4

if #mp.enum_mpattributesubstring("SCPT:SilverCandle.A") >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
