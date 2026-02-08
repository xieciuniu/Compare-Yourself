//
//  UnitConverterTests.swift
//  Compare YourselfTests
//
//  Created by Hubert Wojtowicz on 07/02/2026.
//

import Testing
@testable import Compare_Yourself

struct UnitConverterTests {

    @Test func inchesToCm() async throws {
        // Given
        let inches = 10.0
        
        // When
        let result = await UnitConverter.inchesToCentimeters(inches)
        
        // Then
        #expect(result == 25.4, "Failed to convert 10 inches to 25.4 cm")
    }
    
    @Test func centimetersToInches() async throws {
        let centimeters = 25.4
        
        let result = await UnitConverter.centimetersToInches(centimeters)
        
        #expect(result == 10.0, "Failed to convert 25.4 cm to 10 inches")
    }
    
    @Test func inchesToFeetAndInches() async throws {
        let inches: Double = 72.0
        
        let result = await UnitConverter.inchesToFeetAndInches(inches)
        
        #expect(result.feet == 6, "Failed to convert 72 inches to 6 feet")
        #expect(result.inches == 0, "Failed to convert 72 inches to 0 inches")
    }
    
    @Test func feetAndInchesToTotalInches() async throws {
        let feet: Int = 6
        let inches: Double = 0
        
        let result = await UnitConverter.feetAndInchesToTotalInches(feet: feet, inches: inches)
        
        #expect(result == 72.0, "Failed to convert 6 feet and 0 inches to 72 inches")
    }

}
