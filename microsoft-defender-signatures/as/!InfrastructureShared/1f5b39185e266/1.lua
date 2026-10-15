-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f5b39185e266\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true
l_0_1["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true
l_0_1["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true
l_0_1["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = nil, nil, nil
if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p1) and not isnull((this_sigattrlog[3]).utf8p2) then
  l_0_2 = "cmd.exe"
else
  -- DECOMPILER ERROR at PC89: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R3 in 'AssignReg'

  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) and not isnull((this_sigattrlog[4]).utf8p2) then
    l_0_2 = "powershell.exe"
  else
    -- DECOMPILER ERROR at PC118: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC119: Overwrote pending register: R3 in 'AssignReg'

    if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) and not isnull((this_sigattrlog[5]).utf8p2) then
      l_0_2 = "pwsh.exe"
    else
      -- DECOMPILER ERROR at PC147: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC148: Overwrote pending register: R3 in 'AssignReg'

      if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p1) and not isnull((this_sigattrlog[6]).utf8p2) then
        l_0_2 = "mshta.exe"
      else
        -- DECOMPILER ERROR at PC176: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC177: Overwrote pending register: R3 in 'AssignReg'

        if (this_sigattrlog[7]).matched and not isnull((this_sigattrlog[7]).utf8p1) and not isnull((this_sigattrlog[7]).utf8p2) then
          l_0_2 = "certutil.exe"
        else
          -- DECOMPILER ERROR at PC205: Overwrote pending register: R4 in 'AssignReg'

          -- DECOMPILER ERROR at PC206: Overwrote pending register: R3 in 'AssignReg'

          if (this_sigattrlog[8]).matched and not isnull((this_sigattrlog[8]).utf8p1) and not isnull((this_sigattrlog[8]).utf8p2) then
            l_0_2 = "bitsadmin.exe"
          else
            -- DECOMPILER ERROR at PC234: Overwrote pending register: R4 in 'AssignReg'

            -- DECOMPILER ERROR at PC235: Overwrote pending register: R3 in 'AssignReg'

            if (this_sigattrlog[9]).matched and not isnull((this_sigattrlog[9]).utf8p1) and not isnull((this_sigattrlog[9]).utf8p2) then
              l_0_2 = "wscript.exe"
            else
              -- DECOMPILER ERROR at PC263: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC264: Overwrote pending register: R3 in 'AssignReg'

              if (this_sigattrlog[10]).matched and not isnull((this_sigattrlog[10]).utf8p1) and not isnull((this_sigattrlog[10]).utf8p2) then
                l_0_2 = "cscript.exe"
              else
                -- DECOMPILER ERROR at PC292: Overwrote pending register: R4 in 'AssignReg'

                -- DECOMPILER ERROR at PC293: Overwrote pending register: R3 in 'AssignReg'

                if (this_sigattrlog[11]).matched and not isnull((this_sigattrlog[11]).utf8p1) and not isnull((this_sigattrlog[11]).utf8p2) then
                  l_0_2 = "rundll32.exe"
                else
                  -- DECOMPILER ERROR at PC321: Overwrote pending register: R4 in 'AssignReg'

                  -- DECOMPILER ERROR at PC322: Overwrote pending register: R3 in 'AssignReg'

                  if (this_sigattrlog[12]).matched and not isnull((this_sigattrlog[12]).utf8p1) and not isnull((this_sigattrlog[12]).utf8p2) then
                    l_0_2 = "regsvr32.exe"
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
local l_0_5 = (string.lower)(l_0_4)
local l_0_6 = (string.gsub)(l_0_5, "[\"%s]+", " ")
local l_0_7 = {}
-- DECOMPILER ERROR at PC369: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC370: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC371: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC372: Overwrote pending register: R10 in 'AssignReg'

if not ("-encodedcommand")("-encoded ", " -enc ", true) then
  return mp.CLEAN
end
local l_0_8 = IsTechniqueObservedGlobal("DurableTaintedIisInstance", true)
-- DECOMPILER ERROR at PC388: Overwrote pending register: R12 in 'AssignReg'

;
(bm.add_related_string)("dur_shell_child", l_0_2, ("invoke-expression").RelatedStringBMReport)
;
(bm.add_related_string)("dur_shell_child_path", (string.lower)(l_0_3), bm.RelatedStringBMReport)
;
(bm.add_related_string)("dur_shell_child_cmd", l_0_4, bm.RelatedStringBMReport)
local l_0_9 = bm.add_related_string
local l_0_10 = "dur_shell_post_drop"
local l_0_11 = tostring
do
  l_0_9(l_0_10, l_0_11, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC420: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC422: Overwrote pending register: R11 in 'AssignReg'

  l_0_9(l_0_10, l_0_11, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC429: Overwrote pending register: R9 in 'AssignReg'

  l_0_9()
  -- DECOMPILER ERROR at PC431: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC432: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC433: Overwrote pending register: R11 in 'AssignReg'

  l_0_9(l_0_10, l_0_11, "iis_worker_shell_exec", 28800)
  -- DECOMPILER ERROR at PC437: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC438: Overwrote pending register: R9 in 'AssignReg'

  do return l_0_9 end
  -- DECOMPILER ERROR at PC440: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

