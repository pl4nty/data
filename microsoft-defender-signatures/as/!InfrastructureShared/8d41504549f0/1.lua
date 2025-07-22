-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8d41504549f0\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[3]).matched then
  local l_0_0, l_0_1 = nil, nil
  l_0_1 = ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$")
  local l_0_2 = nil
else
end
do
  -- DECOMPILER ERROR at PC39: Overwrote pending register: R0 in 'AssignReg'

  if not (this_sigattrlog[4]).matched or (this_sigattrlog[5]).matched then
    local l_0_3, l_0_4, l_0_6, l_0_7, l_0_9 = (this_sigattrlog[4]).utf8p2, ((this_sigattrlog[4]).utf8p1):match("([^\\]+)$")
    l_0_6 = this_sigattrlog
    l_0_6 = l_0_6[5]
    l_0_6 = l_0_6.utf8p1
    l_0_6, l_0_7 = l_0_6:match, l_0_6
    l_0_9 = "([^\\]+)$"
    l_0_6 = l_0_6(l_0_7, l_0_9)
    l_0_4 = l_0_6
    local l_0_5, l_0_8, l_0_10 = nil
  else
  end
  do
    if not (this_sigattrlog[6]).matched or not (this_sigattrlog[6]).utf8p2 then
      return mp.CLEAN
    end
    local l_0_11 = nil
    do
      local l_0_12 = ((this_sigattrlog[6]).utf8p1):match("([^\\]+)$")
      local l_0_13 = nil
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC93: Confused about usage of register: R2 in 'UnsetPending'

      ;
      ({HttpCommand = (nri.GetHttpCommand)(), UserAgent = (nri.GetHttpRequestHeader)("User-Agent"), Url = (nri.GetURI)()}).UrlPath = ((({HttpCommand = (nri.GetHttpCommand)(), UserAgent = (nri.GetHttpRequestHeader)("User-Agent"), Url = (nri.GetURI)()}).Url):match("^[^:/]+://[^/]+(/.*)") or ""):match("^([^?]+)%??(.*)$")
      -- DECOMPILER ERROR at PC94: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC94: Confused about usage of register: R2 in 'UnsetPending'

      ;
      ({HttpCommand = (nri.GetHttpCommand)(), UserAgent = (nri.GetHttpRequestHeader)("User-Agent"), Url = (nri.GetURI)()}).PPID = l_0_11
      -- DECOMPILER ERROR at PC95: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC95: Confused about usage of register: R2 in 'UnsetPending'

      ;
      ({HttpCommand = (nri.GetHttpCommand)(), UserAgent = (nri.GetHttpRequestHeader)("User-Agent"), Url = (nri.GetURI)()}).ServerName = l_0_13
      -- DECOMPILER ERROR at PC101: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (MpCommon.BmTriggerSig)(l_0_11, "NRI:AppomalyTracked_HttpVerb", safeJsonSerialize({HttpCommand = (nri.GetHttpCommand)(), UserAgent = (nri.GetHttpRequestHeader)("User-Agent"), Url = (nri.GetURI)()}))
      return mp.CLEAN
    end
  end
end

