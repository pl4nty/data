-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPythonObfuscatedA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC7: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC8: Overwrote pending register: R1 in 'AssignReg'

do
  local l_0_1 = "SCPT:TrojanDownloader:O97M/Encdoc.AVB34!MTB"
  -- DECOMPILER ERROR at PC9: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC10: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("SCPT:TrojanDownloader:PowerShell/Boxter.EA17!MTB")("SCPT:TrojanDownloader:HTML/Obfuse.PVBA4!MTB") do
    local l_0_7 = (mp.enum_mpattributesubstring)(l_0_6)
    if l_0_7 ~= nil and l_0_1 >= 4 then
      (mp.set_mpattribute)("Lua:PythonObfuscated")
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

