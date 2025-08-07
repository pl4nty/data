-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8dd789f51d24\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC6: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC7: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("httpd.exe").GetParentProcInfo)()
-- DECOMPILER ERROR at PC12: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

do
  if not (l_0_1.image_path):match("w3wp") then
    local l_0_2 = not l_0_1 or not "tomcat" or ""
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R5 in 'AssignReg'

  if Contains_any_caseinsenstive(l_0_2, "apache") then
    return mp.INFECTED
  end
  return mp.CLEAN
end

