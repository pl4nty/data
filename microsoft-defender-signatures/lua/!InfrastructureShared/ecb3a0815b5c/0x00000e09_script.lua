-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ecb3a0815b5c\0x00000e09_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 then
    local l_0_4 = nil
    if (mp.GetExecutablesFromCommandLine)((this_sigattrlog[3]).utf8p2) and next((mp.GetExecutablesFromCommandLine)((this_sigattrlog[3]).utf8p2)) then
      for l_0_8,l_0_9 in ipairs((mp.GetExecutablesFromCommandLine)((this_sigattrlog[3]).utf8p2)) do
        local l_0_5 = nil
        -- DECOMPILER ERROR at PC46: Confused about usage of register: R6 in 'UnsetPending'

        R6_PC46 = (mp.ContextualExpandEnvironmentVariables)(R6_PC46)
        if R6_PC46 and (sysio.IsFileExists)(R6_PC46) then
          (bm.add_related_file)(R6_PC46)
        end
      end
    end
  end
  do
    return mp.INFECTED
  end
end

