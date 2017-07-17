# THEORY
all_theorems = []

alpha_upper_bounds = []
alpha_lower_bounds = []

#####
# ALPHA UPPER BOUNDS
#####

# R. Pepper. Binding independence. Ph. D. Dissertation. University of Houston. Houston, TX, 2004.
alpha_annihilation_bound = annihilation_number
add_to_lists(alpha_annihilation_bound, alpha_upper_bounds, all_theorems)

# Nemhauser, George L., and Leslie Earl Trotter. "Vertex packings: structural properties and algorithms." Mathematical Programming 8.1 (1975): 232-248.
# Nemhauser, George L., and Leslie E. Trotter. "Properties of vertex packing and independence system polyhedra." Mathematical Programming 6.1 (1974): 48-61.
alpha_fractional_bound = fractional_alpha
add_to_lists(alpha_fractional_bound, alpha_upper_bounds, all_theorems)

# D. M. Cvetkovic, M. Doob, and H. Sachs. Spectra of graphs. Academic Press, New York, 1980.
alpha_cvetkovic_bound = cvetkovic
add_to_lists(alpha_cvetkovic_bound, alpha_upper_bounds, all_theorems)

# Trivial
alpha_trivial_bound = Graph.order
add_to_lists(alpha_trivial_bound, alpha_upper_bounds, all_theorems)

# Lovasz Theta
alpha_lovasz_theta_bound = Graph.lovasz_theta
add_to_lists(alpha_lovasz_theta_bound, alpha_upper_bounds, all_theorems)

# R. Pepper. Binding independence. Ph. D. Dissertation. University of Houston. Houston, TX, 2004.
def alpha_kwok_bound(g):
    return order(g) - (size(g)/max_degree(g))
add_to_lists(alpha_kwok_bound, alpha_upper_bounds, all_theorems)

# P. Hansen and M. Zheng. Sharp Bounds on the order, size, and stability number of graphs. NETWORKS 23 (1993), no. 2, 99-102.
def alpha_hansen_bound(g):
    return floor(1/2 + sqrt(1/4 + order(g)**2 - order(g) - 2*size(g)))
add_to_lists(alpha_hansen_bound, alpha_upper_bounds, all_theorems)

# Matching Number - Folklore
def alpha_matching_number_bound(g):
    return order(g) - matching_number(g)
add_to_lists(alpha_matching_number_bound, alpha_upper_bounds, all_theorems)

# Min-Degree Theorm
def alpha_min_degree_bound(g):
    return order(g) - min_degree(g)
add_to_lists(alpha_min_degree_bound, alpha_upper_bounds, all_theorems)

# Cut Vertices Theorem
# Three Bounds on the Independence Number of a Graph - C. E. Larson, R. Pepper
def alpha_cut_vertices_bound(g):
    return (g.order() - (card_cut_vertices(g)/2) - (1/2))
add_to_lists(alpha_cut_vertices_bound, alpha_upper_bounds, all_theorems)

# Median Degree Theorem
# Three Bounds on the Independence Number of a Graph - C. E. Larson, R. Pepper
def alpha_median_degree_bound(g):
    return (g.order() - (median_degree(g)/2) - 1/2)
add_to_lists(alpha_median_degree_bound, alpha_upper_bounds, all_theorems)

# Godsil-Newman Upper Bound theorem
# Godsil, Chris D., and Mike W. Newman. "Eigenvalue bounds for independent sets." Journal of Combinatorial Theory, Series B 98.4 (2008): 721-734.
def alpha_godsil_newman_bound(g):
    L = max(g.laplacian_matrix().change_ring(RDF).eigenvalues())
    return g.order()*(L-min_degree(g))/L
add_to_lists(alpha_godsil_newman_bound, alpha_upper_bounds, all_theorems)

# AGX Upper Bound Theorem
#Aouchiche, Mustapha, Gunnar Brinkmann, and Pierre Hansen. "Variable neighborhood search for extremal graphs. 21. Conjectures and results about the independence number." Discrete Applied Mathematics 156.13 (2008): 2530-2542.
def alpha_AGX_upper_bound(g):
    return (g.order() + max_degree(g) - ceil(2 * sqrt(g.order() - 1)))
add_to_lists(alpha_AGX_upper_bound, alpha_upper_bounds, all_theorems)

#####
# LOWER BOUNDS
#####

# Radius Pendants Theorem
# Three Bounds on the Independence Number of a Graph - C. E. Larson, R. Pepper
def alpha_radius_pendants_bound(g):
    return (g.radius() + (card_pendants(g)/2) - 1)
add_to_lists(alpha_radius_pendants_bound, alpha_lower_bounds, all_theorems)

# AGX Lower Bound Theorem
# Aouchiche, Mustapha, Gunnar Brinkmann, and Pierre Hansen. "Variable neighborhood search for extremal graphs. 21. Conjectures and results about the independence number." Discrete Applied Mathematics 156.13 (2008): 2530-2542.
def alpha_AGX_lower_bound(g):
    return ceil(2 * sqrt(g.order()))
add_to_lists(alpha_AGX_lower_bound, alpha_lower_bounds, all_theorems)

def alpha_max_degree_minus_triangles_bound(g):
    return max_degree(g) - number_of_triangles(g)
add_to_lists(alpha_max_degree_minus_triangles_bound, alpha_lower_bounds, all_theorems)

def alpha_order_brooks_bound(g):
    return ceil(order(x)/brooks(x))
add_to_lists(alpha_order_brooks_bound, alpha_lower_bounds, all_theorems)

def alpha_szekeres_wilf_bound(g):
    return ceil(order(x)/szekeres_wilf(x))
add_to_lists(alpha_szekeres_wilf_bound, alpha_lower_bounds, all_theorems)

def alpha_welsh_powell_bound(g):
    return ceil(g.order()/welsh_powell(g))
add_to_lists(alpha_welsh_powell_bound, alpha_lower_bounds, all_theorems)

def alpha_staton_girth_bound(g):
    """
    Hopkins, Glenn, and William Staton. "Girth and independence ratio." Can. Math. Bull. 25.2 (1982): 179-186.
    """
    if g.girth() < 6:
        return 1
    else:
        d = max_degree(g)
        return order(g) * (2* d - 1) / (d^2 + 2 * d - 1)
add_to_lists(alpha_staton_girth_bound, alpha_lower_bounds, all_theorems)

alpha_average_distance_bound = average_distance
add_to_lists(alpha_average_distance_bound, alpha_lower_bounds, all_theorems)

alpha_radius_bound = Graph.radius
add_to_lists(alpha_radius_bound, alpha_lower_bounds, all_theorems)

alpha_residue_bound = residue
add_to_lists(alpha_residue_bound, alpha_lower_bounds, all_theorems)

alpha_max_even_minus_even_horizontal_bound = max_even_minus_even_horizontal
add_to_lists(alpha_max_even_minus_even_horizontal_bound, alpha_lower_bounds, all_theorems)

alpha_critical_independence_number_bound = critical_independence_number
add_to_lists(alpha_critical_independence_number_bound, alpha_lower_bounds, all_theorems)