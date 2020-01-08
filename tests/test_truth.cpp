#include <gtest/gtest.h>
#include "ejson/ejson.h"

namespace ejson {
TEST(EJSON, TheTruth) { EXPECT_TRUE(ejson::IsTrue()); }
}  // namespace ejson
