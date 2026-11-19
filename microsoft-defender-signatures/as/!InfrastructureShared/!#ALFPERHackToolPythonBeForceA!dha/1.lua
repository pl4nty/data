-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Python/BeForce.A!dha
-- Type: 13
-- MpAttributes: Lua:PYExt | Lua:PYCExt

if #mp.enum_mpattributesubstring("SCPT:BeForce.A") == 1 and #mp.enum_mpattributesubstring("SCPT:BeForce.B") >= 8 then
  return mp.INFECTED
end
return mp.CLEAN
