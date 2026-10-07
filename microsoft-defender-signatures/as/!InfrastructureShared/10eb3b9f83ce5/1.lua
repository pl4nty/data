-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10eb3b9f83ce5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if isnull(l_1_0) then
    return {}
  end
  if type(l_1_0) ~= "table" and type(l_1_0) ~= "userdata" then
    set_research_data("SC_RepoPublish_Error", "InvalidEventObject", true)
    return {}
  end
  local l_1_1, l_1_2, l_1_3, l_1_4, l_1_5 = pcall(function()
    -- function num : 0_0_0 , upvalues : l_1_0
    if l_1_0.matched ~= true then
      return false
    end
    return true, l_1_0.ppid, l_1_0.timestamp, l_1_0.utf8p2
  end
)
  if not l_1_1 then
    set_research_data("SC_RepoPublish_Error", "EventMetadataUnavailable", true)
    return {}
  end
  if not l_1_2 then
    return {}
  end
  if isnull(l_1_3) or type(l_1_3) ~= "string" or type(l_1_4) ~= "number" or l_1_4 <= 0 or l_1_4 - l_1_4 ~= 0 then
    set_research_data("SC_RepoPublish_Error", "EventIdentityOrTimeUnavailable", true)
    return {}
  end
  local l_1_6 = {}
  l_1_6.ppid = l_1_3
  l_1_6.timestamp = l_1_4
  l_1_6.command = l_1_5
  return l_1_6
end

local l_0_1 = l_0_0(this_sigattrlog[1])
local l_0_2 = l_0_0(this_sigattrlog[2])
local l_0_3 = l_0_0(this_sigattrlog[3])
local l_0_4 = l_0_0(this_sigattrlog[4])
local l_0_5 = l_0_0(this_sigattrlog[5])
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
for l_0_9,l_0_10 in ipairs({l_0_2, l_0_3, l_0_4, l_0_5}) do
  if l_0_10.ppid ~= l_0_1.ppid then
    return mp.CLEAN
  end
end
do
  if l_0_2.timestamp < l_0_1.timestamp or l_0_3.timestamp < l_0_2.timestamp or l_0_5.timestamp < l_0_3.timestamp or l_0_4.timestamp < l_0_1.timestamp or l_0_5.timestamp < l_0_4.timestamp or l_0_5.timestamp - l_0_1.timestamp > 6000000000 then
    return mp.CLEAN
  end
  local l_0_11 = function(l_2_0)
  -- function num : 0_1
  if isnull(l_2_0) or type(l_2_0) ~= "string" or #l_2_0 > 32768 then
    set_research_data("SC_RepoPublish_Error", "CommandUnavailableOrOversize", true)
    return {}
  end
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or isnull(l_2_2) or type(l_2_2) ~= "table" or #l_2_2 < 2 or #l_2_2 > 128 then
    set_research_data("SC_RepoPublish_Error", "ArgumentParseFailed", true)
    return {}
  end
  for l_2_6,l_2_7 in ipairs(l_2_2) do
    if type(l_2_7) ~= "string" then
      set_research_data("SC_RepoPublish_Error", "InvalidArgumentType", true)
      return {}
    end
  end
  local l_2_8 = {}
  local l_2_9 = {}
  do
    local l_2_10 = 2
    while 1 do
      while 1 do
        while 1 do
          while 1 do
            while 1 do
              while 1 do
                if l_2_10 <= #l_2_2 then
                  local l_2_11 = l_2_2[l_2_10]
                  if l_2_11 == "-c" or (string.sub)(l_2_11, 1, 2) == "-c" then
                    local l_2_12 = (string.sub)(l_2_11, 3)
                    if l_2_11 == "-c" then
                      l_2_10 = l_2_10 + 1
                      l_2_12 = l_2_2[l_2_10]
                    end
                    if isnull(l_2_12) then
                      return {}
                    end
                    do
                      local l_2_13, l_2_14 = (string.match)(l_2_12, "^([^=]+)=(.*)$")
                      if not isnull(l_2_13) then
                        l_2_13 = (string.lower)(l_2_13)
                        if l_2_13 == "http.extraheader" or (string.match)(l_2_13, "^http%..+%.extraheader$") then
                          if l_2_14 == "" then
                            l_2_8[l_2_13] = nil
                          else
                            if (string.match)((string.lower)(l_2_14), "^%s*authorization%s*:%s*%S+%s+%S") then
                              l_2_8[l_2_13] = true
                            end
                          end
                        end
                      end
                      l_2_10 = l_2_10 + 1
                      -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
              if l_2_11 == "-C" or l_2_11 == "--git-dir" or l_2_11 == "--work-tree" then
                if isnull(l_2_2[l_2_10 + 1]) then
                  return {}
                end
                l_2_9[#l_2_9 + 1] = l_2_11
                do
                  local l_2_15 = #l_2_9 + 1
                  l_2_9[l_2_15] = l_2_2[l_2_10 + 1]
                  l_2_10 = l_2_10 + 2
                  -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
            if (string.sub)(l_2_11, 1, 2) == "-C" then
              l_2_9[#l_2_9 + 1] = "-C"
              do
                local l_2_16 = #l_2_9 + 1
                l_2_9[l_2_16] = (string.sub)(l_2_11, 3)
                l_2_10 = l_2_10 + 1
                -- DECOMPILER ERROR at PC186: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC186: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
          if (string.sub)(l_2_11, 1, 10) == "--git-dir=" or (string.sub)(l_2_11, 1, 12) == "--work-tree=" then
            do
              local l_2_17, l_2_18 = (string.match)(l_2_11, "^([^=]+)=(.+)$")
              if isnull(l_2_18) then
                return {}
              end
              l_2_9[#l_2_9 + 1] = l_2_17
              l_2_9[#l_2_9 + 1] = l_2_18
              l_2_10 = l_2_10 + 1
              -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
        if l_2_11 == "--no-pager" or l_2_11 == "--no-optional-locks" or l_2_11 == "--literal-pathspecs" then
          l_2_10 = l_2_10 + 1
          -- DECOMPILER ERROR at PC230: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC230: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      if (string.sub)(l_2_11, 1, 1) == "-" or isnull(l_2_11) then
        return {}
      end
      local l_2_19 = {}
      l_2_19.argv = l_2_2
      l_2_19.index = l_2_10
      l_2_19.action = l_2_11
      l_2_19.selectors = (table.concat)(l_2_9, "\000")
      l_2_19.authorization = next(l_2_8) ~= nil
      return l_2_19
    end
    do return {} end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

  local l_0_12 = l_0_11(l_0_1.command)
  local l_0_13 = l_0_11(l_0_2.command)
  local l_0_14 = l_0_11(l_0_3.command)
  local l_0_15 = l_0_11(l_0_4.command)
  local l_0_16 = l_0_11(l_0_5.command)
  if isnull(l_0_12) or isnull(l_0_13) or isnull(l_0_14) or isnull(l_0_15) or isnull(l_0_16) then
    return mp.CLEAN
  end
  if l_0_12.action ~= "init" or l_0_13.action ~= "add" or l_0_14.action ~= "commit" or l_0_15.action ~= "remote" or l_0_16.action ~= "push" or not l_0_16.authorization then
    return mp.CLEAN
  end
  for l_0_20,l_0_21 in ipairs({l_0_13, l_0_14, l_0_15, l_0_16}) do
    if l_0_21.selectors ~= l_0_12.selectors then
      return mp.CLEAN
    end
  end
  local l_0_22 = function(l_3_0)
  -- function num : 0_2
  local l_3_1 = l_3_0.index + 1
  while 1 do
    while 1 do
      if l_3_1 <= #l_3_0.argv then
        local l_3_2 = (l_3_0.argv)[l_3_1]
        if l_3_2 == "--" then
          return false
        end
        if l_3_2 == "--help" or l_3_2 == "-h" or l_3_2 == "--dry-run" or l_3_0.action == "add" and l_3_2 == "-n" then
          return true
        end
        if l_3_0.action == "commit" and (l_3_2 == "-m" or l_3_2 == "--message" or l_3_2 == "-F" or l_3_2 == "--file" or l_3_2 == "-C" or l_3_2 == "--reuse-message" or l_3_2 == "-c" or l_3_2 == "--reedit-message") then
          l_3_1 = l_3_1 + 2
          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    l_3_1 = l_3_1 + 1
  end
  do
    return false
  end
end

  if l_0_22(l_0_12) or l_0_22(l_0_13) or l_0_22(l_0_14) or #l_0_13.argv <= l_0_13.index then
    return mp.CLEAN
  end
  local l_0_23 = l_0_15.index + 1
  local l_0_24 = (l_0_15.argv)[l_0_23]
  local l_0_25 = (l_0_15.argv)[l_0_23 + 1]
  local l_0_26 = (l_0_15.argv)[l_0_23 + 2]
  -- DECOMPILER ERROR at PC258: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC258: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC258: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC258: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC258: Unhandled construct in 'MakeBoolean' P3

  if (l_0_24 ~= "add" and l_0_24 ~= "set-url") or (string.find)(l_0_26, "%s") then
    return mp.CLEAN
  end
  local l_0_27 = {}
  l_0_27["-o"] = true
  l_0_27["--push-option"] = true
  l_0_27["--receive-pack"] = true
  l_0_27["--exec"] = true
  local l_0_28 = {}
  l_0_28["-u"] = true
  l_0_28["--set-upstream"] = true
  l_0_28["-f"] = true
  l_0_28["--force"] = true
  l_0_28["--force-with-lease"] = true
  l_0_28["--force-if-includes"] = true
  l_0_28["--all"] = true
  l_0_28["--tags"] = true
  l_0_28["--mirror"] = true
  l_0_28["--follow-tags"] = true
  l_0_28["-q"] = true
  l_0_28["--quiet"] = true
  l_0_28["-v"] = true
  l_0_28["--verbose"] = true
  l_0_28["--atomic"] = true
  l_0_28["--no-verify"] = true
  l_0_28["--progress"] = true
  l_0_28["--porcelain"] = true
  local l_0_29 = nil
  local l_0_30 = true
  local l_0_31 = l_0_16.index + 1
  do
    while l_0_31 <= #l_0_16.argv do
      local l_0_32 = (l_0_16.argv)[l_0_31]
      if l_0_30 and l_0_32 == "--" then
        l_0_30 = false
      else
        if l_0_30 and (l_0_32 == "-n" or l_0_32 == "--dry-run" or l_0_32 == "-h" or l_0_32 == "--help") then
          return mp.CLEAN
        else
          if l_0_30 and l_0_27[l_0_32] then
            if isnull((l_0_16.argv)[l_0_31 + 1]) then
              return mp.CLEAN
            end
            l_0_31 = l_0_31 + 1
          else
            if l_0_30 and l_0_32 == "--repo" then
              if not isnull(l_0_29) or isnull((l_0_16.argv)[l_0_31 + 1]) then
                return mp.CLEAN
              end
              l_0_29 = (l_0_16.argv)[l_0_31 + 1]
              l_0_31 = l_0_31 + 1
            else
              if l_0_30 and (string.sub)(l_0_32, 1, 7) == "--repo=" then
                if not isnull(l_0_29) then
                  return mp.CLEAN
                end
                l_0_29 = (string.sub)(l_0_32, 8)
              else
                if l_0_30 and (string.sub)(l_0_32, 1, 1) == "-" and not l_0_28[l_0_32] and not (string.match)(l_0_32, "^%-%-force%-with%-lease=.+") and not (string.match)(l_0_32, "^%-%-push%-option=.+") then
                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
      if isnull(l_0_29) then
        l_0_29 = l_0_32
      end
      l_0_31 = l_0_31 + 1
    end
    if l_0_29 ~= l_0_25 and l_0_29 ~= l_0_26 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("SupplyChainContext", "GitPublicationSequence", bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("PublicationScope", "ActorOnlyRepoAndCredentialsUnproven", bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end

