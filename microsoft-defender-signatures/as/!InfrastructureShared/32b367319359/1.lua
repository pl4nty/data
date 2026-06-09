-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b367319359\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
do
  if not (string.find)(l_0_0, "\\inetpub\\wwwroot", 1, true) then
    local l_0_1, l_0_5, l_0_9, l_0_13 = (string.find)(l_0_0, "/inetpub/wwwroot", 1, true)
  end
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  if not (string.find)(l_0_0, "/grant", 1, true) then
    return mp.CLEAN
  end
  do
    if not (string.find)(l_0_0, "iis_users", 1, true) and not (string.find)(l_0_0, "iis_iusrs", 1, true) and not (string.find)(l_0_0, "iis users", 1, true) then
      local l_0_2, l_0_6, l_0_10, l_0_14 = , (string.find)(l_0_0, "iis iusrs", 1, true)
    end
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R2 in 'UnsetPending'

    if not l_0_6 then
      return mp.CLEAN
    end
    do
      if not (string.find)(l_0_0, ":(rx)", 1, true) and not (string.find)(l_0_0, ":rx", 1, true) then
        local l_0_3, l_0_7, l_0_11, l_0_15 = , (string.find)(l_0_0, "(r,x)", 1, true)
      end
      -- DECOMPILER ERROR at PC118: Confused about usage of register: R3 in 'UnsetPending'

      if not l_0_11 then
        return mp.CLEAN
      end
      do
        if not (string.find)(l_0_0, ".aspx", 1, true) and not (string.find)(l_0_0, ".asp", 1, true) and not (string.find)(l_0_0, ".ashx", 1, true) and not (string.find)(l_0_0, ".asmx", 1, true) and not (string.find)(l_0_0, ".ps1", 1, true) and not (string.find)(l_0_0, ".exe", 1, true) then
          local l_0_4, l_0_8, l_0_12, l_0_16 = , (string.find)(l_0_0, ".dll", 1, true)
        end
        -- DECOMPILER ERROR at PC184: Confused about usage of register: R4 in 'UnsetPending'

        if not l_0_16 then
          return mp.CLEAN
        end
        ;
        (bm.add_related_string)("iis_webroot_acl_cmd", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
        add_parents()
        TrackPidAndTechniqueBM("BM", "T1222.001", "iis_webroot_acl_grant", 28800)
        TrackPidAndTechniqueBM("BM", "T1505.003", "iis_webroot_acl_grant", 28800)
        return mp.INFECTED
      end
    end
  end
end

