-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\74b35d029c4b\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
    for l_0_4 = 1, mp.SIGATTR_LOG_SZ do
      if (sigattr_head[l_0_4]).matched and (sigattr_head[l_0_4]).attribute == 16384 and (sigattr_head[l_0_4]).utf8p1 ~= nil and (sigattr_head[l_0_4]).utf8p2 ~= nil then
        local l_0_5 = (string.lower)((sigattr_head[l_0_4]).utf8p1)
        local l_0_6 = (string.lower)((sigattr_head[l_0_4]).utf8p2)
        if l_0_0 == l_0_5 and (string.find)(l_0_5, "appdata\\local\\temp\\rar$", 1, true) then
          local l_0_7 = (string.match)(l_0_6, "fsize:(%d+)")
          if l_0_7 ~= nil then
            local l_0_8 = tonumber(l_0_7)
            if l_0_8 <= 1000000000 and l_0_8 >= 500000000 then
              if (this_sigattrlog[1]).utf8p2 ~= nil then
                local l_0_9 = "|.7z|.zip|.rar|"
                local l_0_10 = (string.lower)((this_sigattrlog[1]).utf8p2)
                bm_AddRelatedFileFromCommandLine(l_0_10, l_0_9)
              end
              do
                do
                  do return mp.INFECTED end
                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  return mp.CLEAN
end

