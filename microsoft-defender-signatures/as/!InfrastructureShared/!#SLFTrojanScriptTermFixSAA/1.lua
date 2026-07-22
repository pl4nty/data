-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanScriptTermFixSAA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if not (string.find)(l_1_0, "^%s*<#[^#]*:[^#]*#>") then
    return (string.find)(l_1_0, "<#[^#]*:[^#]*#>%s*$")
  end
end

local l_0_1 = (mp.getfilesize)()
;
(mp.readprotection)(false)
local l_0_2 = tostring((mp.readfile)(0, l_0_1))
;
(mp.readprotection)(true)
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_0(l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN

