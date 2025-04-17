// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TRUST_TRACKING_PROTECTION_TRACKING_CHECKER_RESULT_CACHE_H_
#define COMPONENTS_EDGE_TRUST_TRACKING_PROTECTION_TRACKING_CHECKER_RESULT_CACHE_H_

#include <unordered_map>

#include "base/memory/ref_counted.h"
#include "base/sequence_checker.h"

class GURL;

namespace tracking_prevention {

class TrackingCheckerResultCache final
    : public base::RefCountedThreadSafe<TrackingCheckerResultCache> {
 public:
  static scoped_refptr<TrackingCheckerResultCache> Create();

  // Will clear all results
  void ClearCache();

  // Allows a given result status to be cached for later retrieval via
  // GetCacheResult(). |top_frame_url| and |request_url| will be used as keys
  // for each entry. Only the hostnames of each will be taken into consideration
  // so that multiple requests to different paths will all share in the same
  // cached result.
  // e.g.:
  // |top_frame_url|,|request_url| => Entry
  // http://site1.example, https://site2.example                => Entry1 (new)
  // http://site1.example, https://site3.example                => Entry2 (new)
  // http://site1.example, https://site2.example/someotherpath  => Entry1 (old)
  // http://site1.example/somepath, https://site2.example       => Entry1 (old)
  // http://site1.example, https://subdomain.site2.example      => Entry3 (new)
  // http://site1.example, http://site2.example:1234            => Entry1 (old)
  void AddCacheResult(const GURL top_frame_url,
                      const GURL request_url,
                      bool should_block);
  [[nodiscard]] bool GetCacheResult(const GURL& top_frame_url,
                                         const GURL& request_url,
                                         bool* should_block) const;

  // This class is not copyable or movable, we'll delete these operators
  // explicitly.
  TrackingCheckerResultCache(const TrackingCheckerResultCache&) = delete;
  TrackingCheckerResultCache& operator=(const TrackingCheckerResultCache&) =
      delete;

 private:
  TrackingCheckerResultCache();
  ~TrackingCheckerResultCache();

  friend class base::RefCountedThreadSafe<TrackingCheckerResultCache>;

  // Helper to check if a given |top_frame_url|/|request_url| pair is eligible
  // to be cached or not.
  bool IsEligibleForCache(const GURL& top_frame_url,
                          const GURL& request_url) const;

  // Stores a unique result for a pair of GURLs (top_frame_url/request_url) that
  // have been converted to their domain rule form. This is to ensure we cache
  // at the same granularity as we check urls at. The final value is used to
  // indicate if we previously got a tracking checker result along with if the
  // request should be blocked or not.
  std::unordered_map<std::string, std::unordered_map<std::string, bool>>
      cached_results_;

  // Synchronizes access to all members due to background resource loading.
  mutable base::Lock lock_;

  // Checks some methods are called on the same thread to prevent concurrency
  // issues.
  SEQUENCE_CHECKER(monitor_sequence_checker_);
};

}  // namespace tracking_prevention

#endif  // COMPONENTS_EDGE_TRUST_TRACKING_PROTECTION_TRACKING_CHECKER_RESULT_CACHE_H_
