/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WINQTestCase.h"

@interface StatementBeginTests : WINQTestCase

@end

@implementation StatementBeginTests {
}

- (void)setUp
{
    [super setUp];
}

- (void)test_default_constructible
{
    WCDB::StatementBegin constructible __attribute((unused));
}

- (void)test_get_type
{
    XCTAssertEqual(WCDB::StatementBegin().getType(), WCDB::SQL::Type::BeginSTMT);
    XCTAssertEqual(WCDB::StatementBegin::type, WCDB::SQL::Type::BeginSTMT);
}

- (void)test_begin_deferred
{
    auto testingSQL = WCDB::StatementBegin().beginDeferred();

    auto testingTypes = { WCDB::SQL::Type::BeginSTMT };
    IterateAssertEqual(testingSQL, testingTypes);
    SQLAssertEqual(testingSQL, @"BEGIN DEFERRED");
}

- (void)test_begin_immediate
{
    auto testingSQL = WCDB::StatementBegin().beginImmediate();

    auto testingTypes = { WCDB::SQL::Type::BeginSTMT };
    IterateAssertEqual(testingSQL, testingTypes);
    SQLAssertEqual(testingSQL, @"BEGIN IMMEDIATE");
}

- (void)test_begin_exclusive
{
    auto testingSQL = WCDB::StatementBegin().beginExclusive();

    auto testingTypes = { WCDB::SQL::Type::BeginSTMT };
    IterateAssertEqual(testingSQL, testingTypes);
    SQLAssertEqual(testingSQL, @"BEGIN EXCLUSIVE");
}

@end
