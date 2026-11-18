-- Threat: !InfrastructureShared
-- Name: 50787532bdef
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("LoD:VirTool:Win32/Obfuscator.UR") ~= true then
  return mp.CLEAN
end
return mp.INFECTED
