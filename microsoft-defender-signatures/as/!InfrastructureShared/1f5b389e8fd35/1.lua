-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f5b389e8fd35\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2 = nil, nil, nil
if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p1) and not isnull((this_sigattrlog[3]).utf8p2) then
  l_0_0 = "cmd.exe"
else
  -- DECOMPILER ERROR at PC63: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R1 in 'AssignReg'

  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) and not isnull((this_sigattrlog[4]).utf8p2) then
    l_0_0 = "powershell.exe"
  else
    -- DECOMPILER ERROR at PC92: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC93: Overwrote pending register: R1 in 'AssignReg'

    if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) and not isnull((this_sigattrlog[5]).utf8p2) then
      l_0_0 = "pwsh.exe"
    else
      -- DECOMPILER ERROR at PC121: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC122: Overwrote pending register: R1 in 'AssignReg'

      if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p1) and not isnull((this_sigattrlog[6]).utf8p2) then
        l_0_0 = "mshta.exe"
      else
        -- DECOMPILER ERROR at PC150: Overwrote pending register: R2 in 'AssignReg'

        -- DECOMPILER ERROR at PC151: Overwrote pending register: R1 in 'AssignReg'

        if (this_sigattrlog[7]).matched and not isnull((this_sigattrlog[7]).utf8p1) and not isnull((this_sigattrlog[7]).utf8p2) then
          l_0_0 = "certutil.exe"
        else
          -- DECOMPILER ERROR at PC179: Overwrote pending register: R2 in 'AssignReg'

          -- DECOMPILER ERROR at PC180: Overwrote pending register: R1 in 'AssignReg'

          if (this_sigattrlog[8]).matched and not isnull((this_sigattrlog[8]).utf8p1) and not isnull((this_sigattrlog[8]).utf8p2) then
            l_0_0 = "bitsadmin.exe"
          else
            -- DECOMPILER ERROR at PC208: Overwrote pending register: R2 in 'AssignReg'

            -- DECOMPILER ERROR at PC209: Overwrote pending register: R1 in 'AssignReg'

            if (this_sigattrlog[9]).matched and not isnull((this_sigattrlog[9]).utf8p1) and not isnull((this_sigattrlog[9]).utf8p2) then
              l_0_0 = "wscript.exe"
            else
              -- DECOMPILER ERROR at PC237: Overwrote pending register: R2 in 'AssignReg'

              -- DECOMPILER ERROR at PC238: Overwrote pending register: R1 in 'AssignReg'

              if (this_sigattrlog[10]).matched and not isnull((this_sigattrlog[10]).utf8p1) and not isnull((this_sigattrlog[10]).utf8p2) then
                l_0_0 = "cscript.exe"
              else
                -- DECOMPILER ERROR at PC266: Overwrote pending register: R2 in 'AssignReg'

                -- DECOMPILER ERROR at PC267: Overwrote pending register: R1 in 'AssignReg'

                if (this_sigattrlog[11]).matched and not isnull((this_sigattrlog[11]).utf8p1) and not isnull((this_sigattrlog[11]).utf8p2) then
                  l_0_0 = "rundll32.exe"
                else
                  -- DECOMPILER ERROR at PC295: Overwrote pending register: R2 in 'AssignReg'

                  -- DECOMPILER ERROR at PC296: Overwrote pending register: R1 in 'AssignReg'

                  if (this_sigattrlog[12]).matched and not isnull((this_sigattrlog[12]).utf8p1) and not isnull((this_sigattrlog[12]).utf8p2) then
                    l_0_0 = "regsvr32.exe"
                  else
                    return mp.CLEAN
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = (string.gsub)(l_0_3, "[\"%s]+", " ")
local l_0_5 = {}
-- DECOMPILER ERROR at PC343: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC344: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC345: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC346: Overwrote pending register: R8 in 'AssignReg'

if not ("-encodedcommand")("-encoded ", " -enc ", true) then
  return mp.CLEAN
end
local l_0_6 = IsTechniqueObservedGlobal("DurableTaintedIisInstance", true)
-- DECOMPILER ERROR at PC362: Overwrote pending register: R10 in 'AssignReg'

;
(bm.add_related_string)("dur_shell_child", l_0_0, ("invoke-expression").RelatedStringBMReport)
;
(bm.add_related_string)("dur_shell_child_path", (string.lower)(l_0_1), bm.RelatedStringBMReport)
;
(bm.add_related_string)("dur_shell_child_cmd", l_0_2, bm.RelatedStringBMReport)
local l_0_7 = bm.add_related_string
local l_0_8 = "dur_shell_post_drop"
local l_0_9 = tostring
do
  l_0_7(l_0_8, l_0_9, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC394: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC396: Overwrote pending register: R9 in 'AssignReg'

  l_0_7(l_0_8, l_0_9, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC403: Overwrote pending register: R7 in 'AssignReg'

  l_0_7()
  -- DECOMPILER ERROR at PC405: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC406: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC407: Overwrote pending register: R9 in 'AssignReg'

  l_0_7(l_0_8, l_0_9, "iis_worker_shell_exec", 28800)
  -- DECOMPILER ERROR at PC411: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC412: Overwrote pending register: R7 in 'AssignReg'

  do return l_0_7 end
  -- DECOMPILER ERROR at PC414: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

