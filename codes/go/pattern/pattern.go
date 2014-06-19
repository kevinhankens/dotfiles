/*
 *
 */
package main

import (
	"fmt"
	"sort"
	"math"
)

func main() {
	numbers := []float64{1.,2.,1.,2.,1.,5.,1.,2.,1.,2.,1.,2.,-7.,13}

fmt.Printf("original: %q\n", numbers)
	copysort := copySorted(numbers)

fmt.Printf("sorted: %q\n", copysort)

	_ = findMean(numbers);
	_ = findMedian(copysort)

	fmt.Printf("count: %d\n", len(numbers))
	fmt.Printf("mode: %f\n", 0)

	findOutliers(numbers)
}

func findOutliers(numbers []float64) {
	stddev := findStdDev(numbers)
	mean := findMean(numbers);

	for _,value := range numbers {
		dev := math.Sqrt(math.Pow(value - mean, 2.))
		if dev > (stddev * 2) {
fmt.Printf("%f is an outlier\n", value);
		}
	}
}

func findMean(numbers []float64) (mean float64) {
	total := 0.;

	for _,value := range numbers {
		total = total + value
	}

	mean = total/float64(len(numbers))
	fmt.Printf("total: %f\n", total)
	fmt.Printf("mean: %f\n", mean)
	return mean
}

func findMedian(numbers []float64) (median float64) {
	index := len(numbers)/2
	median = numbers[index]
	fmt.Printf("median: %f\n", median)
	return median
}

func copySorted(numbers []float64) (sorted []float64) {
	sorted = make([]float64, len(numbers), (cap(numbers)+1)*2)
	copy(sorted, numbers)
	sort.Sort(sort.Float64Slice(sorted))
	return sorted
}

func findStdDev(numbers []float64) (dev float64) {
	total := 0.
	mean := findMean(numbers)

	for _,value := range numbers {
		dev := math.Pow(value - mean, 2.)
		total = total + dev
	}

	avg := total / float64(len(numbers))
        dev = math.Sqrt(avg)
	fmt.Printf("stddev: %f\n", dev)
	return dev
}
