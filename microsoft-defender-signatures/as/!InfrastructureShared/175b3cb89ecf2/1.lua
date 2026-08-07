-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\175b3cb89ecf2\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2 = nil, nil, nil
if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p1) then
  l_0_0 = "NewAsp"
else
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R1 in 'AssignReg'

  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) then
    l_0_0 = "NewAshx"
  else
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC66: Overwrote pending register: R1 in 'AssignReg'

    if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) then
      l_0_0 = "NewAsmx"
    else
      -- DECOMPILER ERROR at PC85: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC86: Overwrote pending register: R1 in 'AssignReg'

      if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p1) then
        l_0_0 = "NewAsax"
      else
        -- DECOMPILER ERROR at PC105: Overwrote pending register: R2 in 'AssignReg'

        -- DECOMPILER ERROR at PC106: Overwrote pending register: R1 in 'AssignReg'

        if (this_sigattrlog[7]).matched and not isnull((this_sigattrlog[7]).utf8p1) then
          l_0_0 = "NewAscx"
        else
          -- DECOMPILER ERROR at PC125: Overwrote pending register: R2 in 'AssignReg'

          -- DECOMPILER ERROR at PC126: Overwrote pending register: R1 in 'AssignReg'

          if (this_sigattrlog[8]).matched and not isnull((this_sigattrlog[8]).utf8p1) then
            l_0_0 = "NewPhp"
          else
            -- DECOMPILER ERROR at PC145: Overwrote pending register: R2 in 'AssignReg'

            -- DECOMPILER ERROR at PC146: Overwrote pending register: R1 in 'AssignReg'

            if (this_sigattrlog[9]).matched and not isnull((this_sigattrlog[9]).utf8p1) then
              l_0_0 = "ModAsp"
            else
              -- DECOMPILER ERROR at PC165: Overwrote pending register: R2 in 'AssignReg'

              -- DECOMPILER ERROR at PC166: Overwrote pending register: R1 in 'AssignReg'

              if (this_sigattrlog[10]).matched and not isnull((this_sigattrlog[10]).utf8p1) then
                l_0_0 = "ModAshx"
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
local l_0_3 = (string.lower)(l_0_1)
if (string.find)(l_0_3, "\\temporary asp.net files\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\microsoft.net\\framework", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\assembly\\nativeimages", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\servicing\\", 1, true) then
  return mp.CLEAN
end
do
  if not StringEndsWith(l_0_3, ".asp") and not StringEndsWith(l_0_3, ".aspx") and not StringEndsWith(l_0_3, ".ashx") and not StringEndsWith(l_0_3, ".asmx") and not StringEndsWith(l_0_3, ".asax") and not StringEndsWith(l_0_3, ".ascx") then
    local l_0_4 = StringEndsWith(l_0_3, ".php")
  end
  -- DECOMPILER ERROR at PC264: Confused about usage of register: R4 in 'UnsetPending'

  if not l_0_4 then
    return mp.CLEAN
  end
  local l_0_5 = nil
  ;
  (bm.add_related_string)("iis_drop_path", l_0_1, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("iis_drop_op", l_0_2, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("iis_drop_rule", l_0_0, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("iis_drop_in_webroot", tostring(contains(l_0_3, {"\\inetpub\\", "\\wwwroot\\", "\\aspnet_client\\", "\\web server extensions\\", "\\clientaccess\\", "\\frontend\\httpproxy\\", "\\owa\\", "\\ecp\\", "\\exchweb\\"}, true)), bm.RelatedStringBMReport)
  if not (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
    (bm.add_related_file)(l_0_1)
  end
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1505.003", "iis_webshell_drop", 28800)
  return mp.INFECTED
end

