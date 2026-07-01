-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f1d744349771\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) then
  local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if not isnull(l_0_1) then
    l_0_1 = (string.lower)(l_0_1)
    local l_0_2 = {}
    -- DECOMPILER ERROR at PC29: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC31: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC32: Overwrote pending register: R5 in 'AssignReg'

    if ("invoke-webrequest")("invoke-expression", "| invoke-expression") then
      return mp.INFECTED
    end
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

