#include "gtest/gtest.h"
#include <bitset>

extern "C" const char* Positivity(int64_t x);
extern "C" bool CheckOverflow(int64_t x, int64_t y);
extern "C" int64_t Function(int64_t x);
extern "C" bool IsInCircle(int64_t x, int64_t y, int64_t d);
extern "C" bool TwoIntegers(int64_t x, int64_t y);
extern "C" int8_t CountNumbers(int64_t a, int64_t b, int64_t c);
extern "C" const char* Switch(int64_t k);
extern "C" int8_t MagicMetric(int64_t x);

// ---------------------------------------------------------

TEST(Positivity, Simple) {
  {
    EXPECT_STREQ(Positivity(1), "Yeah) It's positive :D");
    EXPECT_STREQ(Positivity(100), "Yeah) It's positive :D");
    EXPECT_STREQ(Positivity(1184732), "Yeah) It's positive :D");
    EXPECT_STREQ(Positivity(INT64_MAX), "Yeah) It's positive :D");
  }
  {
    EXPECT_STREQ(Positivity(0), "Ohh.. so much negative :(");
    EXPECT_STREQ(Positivity(-1973), "Ohh.. so much negative :(");
    EXPECT_STREQ(Positivity(-18), "Ohh.. so much negative :(");
    EXPECT_STREQ(Positivity(INT64_MIN), "Ohh.. so much negative :(");
  }
}

TEST(CheckOverflow, Simple) {
  {
    EXPECT_FALSE(CheckOverflow(1, 1));
    EXPECT_FALSE(CheckOverflow(-7, 5));
    EXPECT_FALSE(CheckOverflow(0, 4));
  }
  {
    EXPECT_TRUE(CheckOverflow(127346182, 197346813));
    EXPECT_TRUE(CheckOverflow(27845689624, 0));
    EXPECT_TRUE(CheckOverflow(0, -92327356121));
    EXPECT_TRUE(CheckOverflow(0, 0));
  }
}

TEST(Function, Simple) {
  {
    EXPECT_EQ(Function(-1), 3);
    EXPECT_EQ(Function(17), 7);
    EXPECT_EQ(Function(0), 4);
    EXPECT_EQ(Function(1), 5);
  }
  {
    EXPECT_EQ(Function(-2), 5);
    EXPECT_EQ(Function(-3), 15);
    EXPECT_EQ(Function(18), -5834);
  }
}

TEST(InCircle, Simple) {
  {
    EXPECT_TRUE(IsInCircle(-1, 1, 8));
    EXPECT_TRUE(IsInCircle(-1, 1, 7));
    EXPECT_TRUE(IsInCircle(-269, 320, 2147483650));
    EXPECT_TRUE(IsInCircle(4, 3, 10));
  }
  {
    EXPECT_FALSE(IsInCircle(2, 0, 1));
    EXPECT_FALSE(IsInCircle(-4, -3, 4));
    EXPECT_FALSE(IsInCircle(1'073'741'824, 0, 27567));
  }
}

TEST(TwoIntegers, Simple) {
  {
    EXPECT_TRUE(TwoIntegers(0, 0));
    EXPECT_TRUE(TwoIntegers(89457, 0));
    EXPECT_TRUE(TwoIntegers(0, -18324));
    EXPECT_TRUE(TwoIntegers(100, 2));
    EXPECT_TRUE(TwoIntegers(2, INT64_MIN));
    EXPECT_TRUE(TwoIntegers(INT64_MIN, -2));
  }
  {
    EXPECT_FALSE(TwoIntegers(INT64_MAX, 2));
    EXPECT_FALSE(TwoIntegers(INT64_MIN, 7));
    EXPECT_FALSE(TwoIntegers(-4, 5));
    EXPECT_FALSE(TwoIntegers(22, INT64_MAX));
  }
}

TEST(CountNumbers, Simple) {
  {
    EXPECT_EQ(CountNumbers(1, 1, 2), 0);
    EXPECT_EQ(CountNumbers(3, 10, 6), 1);
    EXPECT_EQ(CountNumbers(2, INT64_MAX, 32), 1);
    EXPECT_EQ(CountNumbers(1, 23, 55), 0);
    EXPECT_EQ(CountNumbers(3, 4, 7), 2);
  }
}

TEST(Swich, Simple) {
  {
    EXPECT_STREQ(Switch(2), "That's bad");
    EXPECT_STREQ(Switch(0), "That's bad");
    EXPECT_STREQ(Switch(5), "That's bad");
    EXPECT_STREQ(Switch(43), "No comments.");
    EXPECT_STREQ(Switch(42), "No comments.");
    EXPECT_STREQ(Switch(4), "No comments.");
  }
  {
    EXPECT_STREQ(Switch(1000), "Perfecto!!!");
    EXPECT_STREQ(Switch(100), "Perfecto!!!");
    EXPECT_STREQ(Switch(10), "Perfecto!!!");
    EXPECT_STREQ(Switch(-1), "Ooops");
    EXPECT_STREQ(Switch(-2), "Ooops");
    EXPECT_STREQ(Switch(-3), "Ooops");
  }
  {
    EXPECT_STREQ(Switch(-99), "Nice :)");
    EXPECT_STREQ(Switch(-100), "Nice :)");
  }
}

TEST(MagicMetrix, Simple) {
  {
    EXPECT_EQ(MagicMetric(99), 0);
    EXPECT_EQ(MagicMetric(9'999'999), 0);
    EXPECT_EQ(MagicMetric(11'121'112), 2);
    EXPECT_EQ(MagicMetric(99'999'999), 3);
    EXPECT_EQ(MagicMetric(10'000'000), 1);
    EXPECT_EQ(MagicMetric(10'000'001), 2);
    EXPECT_EQ(MagicMetric(92'999'229), 3);
    EXPECT_EQ(MagicMetric(92'299'229), 4);
    EXPECT_EQ(MagicMetric(22'222'222), 3);
  }
  {
    EXPECT_EQ(MagicMetric(2345), 0);
    EXPECT_EQ(MagicMetric(12344321), 2);
    EXPECT_EQ(MagicMetric(10344301), 1);
  }
}

// ---------------------------------------------------------
