-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2ca_490.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC7: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC8: Overwrote pending register: R1 in 'AssignReg'

do
  local l_0_1 = "AGGR:ContextFileInclusion.A"
  -- DECOMPILER ERROR at PC9: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC10: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("Lua:Win32/ExeFileWithExport.A")("SIGATTR:MatchRegOpenKey") do
    if (mp.get_mpattributevalue)(l_0_6) ~= nil and l_0_1 >= 6 then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

