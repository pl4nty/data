-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\105b30c9941d8\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched then
  if (this_sigattrlog[1]).utf8p1 == nil or (this_sigattrlog[1]).utf8p1 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

  local l_0_0, l_0_1 = nil, nil
  l_0_1 = "/DAFOM%-tmp%w+$"
  local l_0_2 = nil
else
  do
    if (this_sigattrlog[2]).matched then
      if (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" then
        return mp.CLEAN
      end
    else
      if (this_sigattrlog[3]).matched then
        if (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p1 == "" then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC66: Overwrote pending register: R0 in 'AssignReg'

        local l_0_3, l_0_4 = (this_sigattrlog[2]).utf8p1, "/Esilet%-tmp%w+$"
        l_0_4 = "/silet%-tmp%w+$"
        local l_0_5 = nil
      else
        do
          if (this_sigattrlog[4]).matched then
            if (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[4]).utf8p1 == "" then
              return mp.CLEAN
            end
          else
            if (this_sigattrlog[5]).matched then
              if (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[5]).utf8p1 == "" then
                return mp.CLEAN
              end
              -- DECOMPILER ERROR at PC112: Overwrote pending register: R0 in 'AssignReg'

              local l_0_6, l_0_7, l_0_9, l_0_10, l_0_12 = (this_sigattrlog[4]).utf8p1, "/DAFOM%-tmp%w+$"
              l_0_7 = "/Esilet%-tmp%w+$"
              local l_0_8, l_0_11, l_0_13 = nil
            else
              do
                if (this_sigattrlog[6]).matched then
                  if (this_sigattrlog[6]).utf8p1 == nil or (this_sigattrlog[6]).utf8p1 == "" then
                    return mp.CLEAN
                  end
                end
                if not (string.match)((this_sigattrlog[6]).utf8p1, "/silet%-tmp%w+$") then
                  return mp.CLEAN
                end
                TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter_ExactMatch")
                return mp.INFECTED
              end
            end
          end
        end
      end
    end
  end
end

