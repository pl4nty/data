-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19b3569f8624\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "MasqueradeTLS.Lazarus"
local l_0_1, l_0_2, l_0_3 = (string.match)((this_sigattrlog[1]).utf8p2 or "", "DestIp=([%d%.]+);DestPort=(%d+);.-Uri=(.-);")
local l_0_4 = bm.add_related_string
local l_0_5 = l_0_0
local l_0_6 = safeJsonSerialize
local l_0_7 = {}
do
  l_0_7.IP = l_0_1 or ""
  l_0_7.Port = l_0_2 or ""
  l_0_7.URI = l_0_3 or ""
  l_0_7.P2 = (this_sigattrlog[1]).utf8p2 or ""
  l_0_6 = l_0_6(l_0_7)
  l_0_7 = bm
  l_0_7 = l_0_7.RelatedStringBMReport
  l_0_4(l_0_5, l_0_6, l_0_7)
  l_0_4 = bm
  l_0_4 = l_0_4.get_current_process_startup_info
  l_0_4 = l_0_4()
  if l_0_4 then
    l_0_5 = l_0_4.ppid
    if l_0_5 then
      l_0_5 = TrackPidAndTechniqueBM
      l_0_6 = this_sigattrlog
      l_0_6 = l_0_6[1]
      l_0_6 = l_0_6.ppid
      l_0_7 = "T1001"
      l_0_5(l_0_6, l_0_7, "c2_tls_masquerade")
      l_0_5 = TrackPidAndTechniqueBM
      l_0_6 = this_sigattrlog
      l_0_6 = l_0_6[1]
      l_0_6 = l_0_6.ppid
      l_0_7 = "T1041"
      l_0_5(l_0_6, l_0_7, "c2_tls_masquerade")
      l_0_5 = TrackPidAndTechniqueBM
      l_0_6 = this_sigattrlog
      l_0_6 = l_0_6[1]
      l_0_6 = l_0_6.ppid
      l_0_7 = "T1571"
      l_0_5(l_0_6, l_0_7, "c2_tls_masquerade")
    end
  end
  l_0_5 = mp
  l_0_5 = l_0_5.INFECTED
  do return l_0_5 end
  -- DECOMPILER ERROR at PC71: freeLocal<0 in 'ReleaseLocals'

end

