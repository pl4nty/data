-- Threat: !InfrastructureShared
-- Name: a27860794b05
-- Type: 21
-- Flags: 1

local l_0_0 = hstrlog[3].matched
local l_0_1 = hstrlog[4].matched
local l_0_2 = hstrlog[5].matched
local l_0_3 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0)
if 2 <= l_0_3 then
  return mp.SUSPICIOUS
end
mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.AFG")
return mp.CLEAN
