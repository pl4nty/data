-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellAmsiBypazzZ!MTB\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 131072 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
do
  local l_0_1, l_0_2 = tostring((mp.readfile)(0, l_0_0)) or ""
  ;
  (mp.readprotection)(true)
  local l_0_3 = nil
  local l_0_4 = "([iI][eE][xX]|[iI][nN][vV][oO][kK][eE]%-[eE][xX][pP][rR][eE][sS][sS][iI][oO][nN])\\s*\\(\\s*\\[string\\]::new\\s*\\(\\s*\\(\\s*\\d+\\s*,\\s*\\d+\\s*,\\s*\\d+(?:\\s*,\\s*\\d+){20,}\\s*\\)\\s*\\)"
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R3 in 'AssignReg'

  if false == false then
    return mp.CLEAN
  end
  return mp.INFECTED
end

