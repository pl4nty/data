-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanLNKArcticShelfA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetLnkInfo)()
if not l_0_0 or type(l_0_0.Arguments) ~= "string" or l_0_0.Arguments == "" then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC24: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R4 in 'AssignReg'

  if not ("pythonw.exe ")(" schtasks /", " curl ") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

