-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b5b3cf202bff\1.luac 

-- params : ...
-- function num : 0
if not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2 = nil, nil, nil
if (this_sigattrlog[1]).matched then
  l_0_0 = "temp"
else
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R1 in 'AssignReg'

  if (this_sigattrlog[2]).matched then
    l_0_0 = "temp"
  else
    -- DECOMPILER ERROR at PC53: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC54: Overwrote pending register: R1 in 'AssignReg'

    if (this_sigattrlog[3]).matched then
      l_0_0 = "temp"
    else
      -- DECOMPILER ERROR at PC66: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC67: Overwrote pending register: R1 in 'AssignReg'

      if (this_sigattrlog[4]).matched then
        l_0_0 = "appdata"
      else
        -- DECOMPILER ERROR at PC79: Overwrote pending register: R2 in 'AssignReg'

        -- DECOMPILER ERROR at PC80: Overwrote pending register: R1 in 'AssignReg'

        if (this_sigattrlog[5]).matched then
          l_0_0 = "appdata"
        else
          -- DECOMPILER ERROR at PC92: Overwrote pending register: R2 in 'AssignReg'

          -- DECOMPILER ERROR at PC93: Overwrote pending register: R1 in 'AssignReg'

          if (this_sigattrlog[6]).matched then
            l_0_0 = "appdata"
          else
            -- DECOMPILER ERROR at PC105: Overwrote pending register: R2 in 'AssignReg'

            -- DECOMPILER ERROR at PC106: Overwrote pending register: R1 in 'AssignReg'

            if (this_sigattrlog[7]).matched then
              l_0_0 = "programdata"
            else
              -- DECOMPILER ERROR at PC118: Overwrote pending register: R2 in 'AssignReg'

              -- DECOMPILER ERROR at PC119: Overwrote pending register: R1 in 'AssignReg'

              if (this_sigattrlog[8]).matched then
                l_0_0 = "programdata"
              else
                -- DECOMPILER ERROR at PC131: Overwrote pending register: R2 in 'AssignReg'

                -- DECOMPILER ERROR at PC132: Overwrote pending register: R1 in 'AssignReg'

                if (this_sigattrlog[9]).matched then
                  l_0_0 = "programdata"
                else
                  -- DECOMPILER ERROR at PC144: Overwrote pending register: R2 in 'AssignReg'

                  -- DECOMPILER ERROR at PC145: Overwrote pending register: R1 in 'AssignReg'

                  if (this_sigattrlog[10]).matched then
                    l_0_0 = "public"
                  else
                    -- DECOMPILER ERROR at PC157: Overwrote pending register: R2 in 'AssignReg'

                    -- DECOMPILER ERROR at PC158: Overwrote pending register: R1 in 'AssignReg'

                    if (this_sigattrlog[11]).matched then
                      l_0_0 = "public"
                    else
                      -- DECOMPILER ERROR at PC170: Overwrote pending register: R2 in 'AssignReg'

                      -- DECOMPILER ERROR at PC171: Overwrote pending register: R1 in 'AssignReg'

                      if (this_sigattrlog[12]).matched then
                        l_0_0 = "public"
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
  end
end
;
(bm.add_related_string)("winrm_payload_drop", l_0_0 .. ":" .. l_0_1, bm.RelatedStringBMReport)
if l_0_2 then
  (bm.add_related_file)(l_0_2)
end
;
(mp.set_mpattribute)("Lua:Context/WinRMSessionDroppedFile.A")
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMPayloadDrop")
TrackPidAndTechniqueBM("BM", "T1105", "WinRMPayloadDrop")
add_parents()
return mp.INFECTED

